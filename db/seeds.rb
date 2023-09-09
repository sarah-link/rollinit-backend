# frozen_string_literal: true

require 'json'

def strip_html_tags(str)
  str&.gsub!(/<.*?>/, '')&.strip!
end

def remove_parens(str)
  str&.tr!('()', '')
end

def remove_parens_and_content(str)
  str&.gsub!(/\(.*?\)/, '')&.strip!
end

admin_user = User.new(name: :Admin, email: 'admin@example.com')
admin_user.save

json = JSON.parse(File.read('lib/seeds/srd_5e_monsters.json'))

json.each do |hash|
  c = Creature.new

  c.size = hash['meta'].split(',')[0].split[0].capitalize
  c.creature_type = hash['meta'].split(',')[0].split[1].capitalize
  c.alignment = hash['meta'].split(',')[1].strip.capitalize

  c.armor_class = remove_parens_and_content hash['Armor Class']
  c.hit_points = remove_parens_and_content hash['Hit Points']

  c.name = hash['name']
  c.speed = hash['Speed']
  c.str = hash['STR']
  c.str_mod = remove_parens hash['STR_mod']
  c.dex = hash['DEX']
  c.dex_mod = remove_parens hash['DEX_mod']
  c.con = hash['CON']
  c.con_mod = remove_parens hash['CON_mod']
  c.int = hash['INT']
  c.int_mod = remove_parens hash['INT_mod']
  c.wis = hash['WIS']
  c.wis_mod = remove_parens hash['WIS_mod']
  c.cha = hash['CHA']
  c.cha_mod = remove_parens hash['CHA_mod']
  c.saving_throws = hash['Saving Throws']
  c.skills = hash['Skills']
  c.senses = hash['Senses']
  c.languages = hash['Languages']
  c.cr = remove_parens_and_content hash['Challenge']
  c.traits = strip_html_tags hash['Traits']
  c.actions = strip_html_tags hash['Actions']
  c.legendary_actions = strip_html_tags hash['Legendary Actions']
  c.damage_immunities = hash['Damage Immunities']
  c.condition_immunities = hash['Condition Immunities']
  c.damage_resistances = hash['Damage Resistances']
  c.damage_vulnerabilities = hash['Damage Vulnerabilities']
  c.reactions = strip_html_tags hash['Reactions']
  c.user_id = 1
  c.base_creature = true

  c.save
end
