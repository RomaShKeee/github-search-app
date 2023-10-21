# frozen_string_literal: true

require_relative 'spec_helper'

describe '/' do
  it 'should display repository data for a valid query' do
    visit '/'
    page.title.must_equal 'GithubSearchApp'
    fill_in 'query', with: 'roda'
    VCR.use_cassette('search') do
      click_button 'Search'
    end
    assert page.has_content? 'roda'
  end

  it 'should display next page when "Next" is clicked' do
    visit '/'
    fill_in 'query', with: 'test'
    VCR.use_cassette('search_pagination') do
      click_button 'Search'
      click_link 'Next'
    end
    assert page.has_content? 'Page 2'
  end
end
