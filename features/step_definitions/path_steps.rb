Given %r{^(?:|I )am on (?!.*page object)(.+)$} do |page_name|
  visit path_to(page_name)
end

When %r{^(?:|I )go to (?!.*page object)(.+)$} do |page_name|
  visit path_to(page_name)
end

Then %r{^(?:|I )should be on (.+)$} do |page_name|
  current_path = nil
  expected_path = path_to page_name

  begin
    current_path = URI.parse(current_url).path
    SitePrism::Waiter.wait_until_true { current_path == expected_path }
  rescue SitePrism::TimeoutException
    warn "expected: #{expected_path}, got: #{current_path}"
    raise
  end
end
