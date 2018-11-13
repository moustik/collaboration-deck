require 'squib'
require 'game_icons'

durations = Hash["short" => 1, "medium" => 2, 'long' => 3]

data = Squib.xlsx file: 'data.xlsx'
data['description'].each { |str| str.gsub! /%n/, "\n" if not str.nil? } #replaces %n with newline
data['description'].each { |str| str.gsub! /<html>/, "" if not str.nil? }
data['description'].each { |str| str.gsub! /<\/html>/, "" if not str.nil? }
data['symbol'] = data['symbol'].map { |e| GameIcons.get(e == "none" ? "cancel" : e || "cancel").recolor(fg: '000', bg_opacity: 0, fg_opacity: e == 'none' ? 0 : 1 ).string }
data['type'] = data['type'].map { |e| e == 'd' ? :burnt_orange : :dark_red }
data['duration'] = data['duration'].map { |e| durations[e] }

Squib::Deck.new(cards: data['name'].size, layout: 'layout.yml',
                width: '8cm', height: '9.5cm') do
  rect layout: 'bleed' #, radius: '2mm'
  rect layout: 'border', fill_color: data['type']
  rect layout: 'titlebox'
  rect layout: 'descriptionbox'
  triangle layout: 'notice_corner', fill_color: data['type']
  circle layout: 'notice_circle', range: data['notice'].each_index.select{ |i| data['notice'][i]}

  text str: data['name'], layout: 'title'

  1.upto(3).each do |n|
    range = data['duration'].each_index.select { |i| data['duration'][i] == n}
    n.times do |i|
      svg data: GameIcons.get('stopwatch').recolor(fg: 'aaa', bg_opacity: 0).string,
          range: range, layout: 'duration',
          x: 100 + i*100, width: 100, height: 100
    end
  end

  svg data: data['symbol'], layout: 'symbol'
  text str: data['description'], markup: true, layout: 'description'

  #svg data: GameIcons.get('radar-sweep').recolor(fg: '000', bg_opacity: 0).string,
  text str: "<b>!</b>", markup: true,
      range: data['notice'].each_index.select{ |i| data['notice'][i]},
      layout: 'notice_image'

  save_png trim: 10

  # Save to A4 @ 300dpi
  save_pdf gap: '0mm', width: '297mm', height: '210mm'
end
