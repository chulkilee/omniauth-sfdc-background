# encoding: utf-8
guard :spork, rspec_env: { RAILS_ENV: 'test' } do
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
end

guard :rspec, cli: '--color --format progress --drb' do
  watch(/^spec\/.+_spec\.rb$/)
  watch(/^lib\/(.+)\.rb$/)      { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { 'spec' }

  watch(%r(^spec/support/(.+)\.rb$)) { 'spec' }
end

guard :cane do
  watch(/.*\.rb/)
end

guard :rubocop do
  watch('Rakefile')
  watch('Guardfile')
  watch(/.+\.rb$/)
  watch(/(?:.+\/)?\.rubocop\.yml$/) { |m| File.dirname(m[0]) }
end
