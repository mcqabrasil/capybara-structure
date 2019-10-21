Before do
  page.current_window.resize_to(1440, 900) # Adjust as your needs
  page.current_window.size[90] # Adjust as your needs

  # Actions classes initialization
  @pg_name_act = PageNameAction.new

  # Assertion classes initialization
  @pg_name_assert = FunctionNameAssertion.new

  visit('/')
end

After do
  # Add code for all scenarios as your needs
end

# Add below 'before' and 'afters' as your needs on your specifics scenarios
Before '@Tag_name' do
  # Add code as your needs
end

After '@Tag_name' do
  # Add code as your needs
end
