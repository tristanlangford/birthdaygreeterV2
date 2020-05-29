
require 'timecop'

feature 'Hompage' do

  scenario 'greets user' do
    visit("/")
    expect(page).to have_content("Hello there!")
  end

  scenario 'form that asks for Name, birth day, birth month' do
    visit("/")
    expect(page).to have_content("What's your name?")
  end

  scenario 'form that asks for Name, birth day, birth month' do
    visit("/")
    expect(page).to have_content("Day:")
  end

  scenario 'form that asks for Name, birth day, birth month' do
    visit("/")
    expect(page).to have_content("Month")
  end

  scenario 'form that asks for Name, birth day, birth month' do
    visit("/")
    expect(page).to have_button("Go")
  end

  scenario 'shows Happy Birthday when form submitted' do
    Timecop.freeze(Time.parse("22 March"))
    visit("/")
    fill_in("name", with: "Tristan")
    fill_in("day", with: "22")
    select("March", from: "month")
    click_on("Go")
    expect(page).to have_content("Happy Birthday Tristan!")
  end

  scenario 'shows Happy Birthday when form submitted' do
    Timecop.freeze(Time.parse("22 March"))
    visit("/")
    fill_in("name", with: "Tristan")
    fill_in("day", with: "21")
    select("March", from: "month")
    click_on("Go")
    expect(page).to have_content("Your birthday will be in 1 days, Tristan")
  end



end
