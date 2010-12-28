Game.transaction do
  ['Baldur\'s Gate', 'Baldur\'s Gate II - SoA/ToB', 'Baldur\'s Gate II - SoA', 'Baldur\'s Gate Trilogy', 'Baldur\'s Gate TuTu/easyTuTu', 'Icewind Dale', 'Icewind Dale II', 'Planescape: Torment'].each do |game|
    Game.create(:name => game)
  end
end