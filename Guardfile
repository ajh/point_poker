guard "cucumber", all_on_start: false, all_after_pass: false do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})          { "features" }

  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) do |m|
    Dir[File.join("**/#{m[1]}.feature")][0] || "features"
  end
end
