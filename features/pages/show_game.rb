class ShowGame < SitePrism::Page
  set_url '/games/:token'

  element :game_title, 'h1[data-test=title]'

  section :new_story, 'form#new_story' do
    element :description_field, '#story_description'
    element :submit, 'input[type=submit]'
  end

  sections :stories, '#stories .story' do
    element :story_title, '.panel-title'
    element :potential_play, '.potential.play'
    elements :face_down_plays, '.play.face-down'
    elements :face_up_plays, '.play.face-up'
  end
end
