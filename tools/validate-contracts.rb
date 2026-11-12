# Every contract file must be UTF-8 and parse as YAML.
#
# WHY THIS EXISTS (13 Nov 2026): one unquoted colon in a text value made a
# strict parser reject epn_deployments' whole components file. The app's
# Operators page then drew two empty bars and nothing else, the Sites links
# with it, and nobody could tell why: the data arrived, the tiles existed, and
# every component was silently missing. Three more files were broken the same
# way (a Latin-1 byte, a double-encoded apostrophe, another colon).
#
# Known-invalid files are listed, with a reason, in
# tools/known-invalid-contracts.txt; anything else that fails stops the push.
require 'yaml'
require 'date'

root = ARGV[0] || 'src/main/contracts'
known = {}
File.readlines(File.join(__dir__, 'known-invalid-contracts.txt'), chomp: true).each do |l|
  next if l.strip.empty? || l.start_with?('#')
  path, reason = l.split(/\s+#\s*/, 2)
  known[path.strip] = reason
end

failed = []
Dir.glob(File.join(root, '**', '*.{yaml,yml}')).sort.each do |f|
  bytes = File.binread(f)
  err =
    if !bytes.dup.force_encoding('UTF-8').valid_encoding?
      'not valid UTF-8'
    else
      # A byte-order mark is allowed at the start of a YAML stream; noted only.
      puts "::warning file=#{f}::starts with a byte-order mark" if bytes.start_with?("\xEF\xBB\xBF".b)
      begin
        YAML.safe_load(bytes.force_encoding('UTF-8'), aliases: true, permitted_classes: [Date, Time, Symbol])
        nil
      rescue Psych::Exception => e
        e.message.sub(/^\(.*?\): /, '')
      end
    end
  next unless err
  if known.key?(f)
    puts "known invalid (#{known[f]}): #{f}"
  else
    failed << [f, err]
  end
end

stale = known.keys.reject { |k| File.exist?(k) }
stale.each { |k| puts "::warning::known-invalid entry no longer exists: #{k}" }

if failed.empty?
  puts 'every contract file is UTF-8 and parses'
else
  failed.each { |f, e| puts "::error file=#{f}::#{e}" }
  puts "#{failed.size} contract file(s) would be dropped whole by the app"
  exit 1
end
