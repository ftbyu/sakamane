15.times do |i|
  player = Player.find_or_initialize_by(email: "player+man#{i}@gmail.com")
  player.update!(
    manager_id: "1",
    first_name: "太朗#{i}",
    last_name: "山田#{i}",
    kana_first_name: "たろう#{i}",
    kana_last_name: "やまだ#{i}",
    height: "177",
    weight: "66",
    grade: "3",
    password: "#{i}#{i}#{i}#{i}#{i}#{i}",
  )
end

[
  {name: "シュート数", is_validity: true},
  {name: "得点数", is_validity: true},
  {name: "ボール奪取数", is_validity: true},
  {name: "空中戦勝利数", is_validity: true},
  {name: "クロス数", is_validity: true},
  {name: "反則数", is_validity: true},
].each do |analiysis|
  Analiysis.find_or_create_by!(analiysis)
end

[
  {name: "大船渡高校グランド", is_validity: true},
  {name: "遠野グランド", is_validity: true},
  {name: "盛岡グランド", is_validity: true},
  {name: "一関グランド", is_validity: true}
].each do |location|
  Location.find_or_create_by!(location)
end

[
  {name: "リーグ戦", is_validity: true},
  {name: "高総体", is_validity: true},
  {name: "練習試合", is_validity: true}
].each do |type|
  Type.find_or_create_by!(type)
end
