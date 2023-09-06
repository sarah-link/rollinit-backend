require 'json'

def strip_html_tags(str)
  return nil if str == nil
  str.gsub!(/<.*?>/, '')
end

def remove_parens(str)
  return nil if str == nil
  str.tr!('(', '').tr!(')', '')
end

def remove_parens_and_content(str)
  return nil if str == nil
  str.gsub!(/\s\([^()]*\)/, '')
end

admin_user = User.new
admin_user.name = "Admin"
admin_user.email = "admin@example.com"
admin_user.save


json = JSON.parse(File.read('lib/seeds/srd_5e_monsters.json'))

json.each do |hash|
  m = Monster.new

  m.size = hash["meta"].split(',')[0].split[0].capitalize
  m.monster_type = hash["meta"].split(',')[0].split[1].capitalize
  m.alignment = hash["meta"].split(',')[1].strip.capitalize

  m.name = hash["name"]
  m.armor_class = remove_parens_and_content hash["Armor Class"]
  m.hit_points = hash["Hit Points"]
  m.speed = hash["Speed"]
  m.str = hash["STR"]
  m.str_mod = remove_parens hash["STR_mod"]
  m.dex = hash["DEX"]
  m.dex_mod = remove_parens hash["DEX_mod"]
  m.con = hash["CON"]
  m.con_mod = remove_parens hash["CON_mod"]
  m.int = hash["INT"]
  m.int_mod = remove_parens hash["INT_mod"]
  m.wis = hash["WIS"]
  m.wis_mod = remove_parens hash["WIS_mod"]
  m.cha = hash["CHA"]
  m.cha_mod = remove_parens hash["CHA_mod"]
  m.saving_throws = hash["Saving Throws"]
  m.skills = hash["Skills"]
  m.senses = hash["Senses"]
  m.languages = hash["Languages"]
  m.cr = remove_parens_and_content hash["Challenge"]
  m.traits = strip_html_tags hash["Traits"]
  m.actions = strip_html_tags hash["Actions"]
  m.legendary_actions = strip_html_tags hash["Legendary Actions"]
  m.damage_immunities = hash["Damage Immunities"]
  m.condition_immunities = hash["Condition Immunities"]
  m.damage_resistances = hash["Damage Resistances"]
  m.damage_vulnerabilities = hash["Damage Vulnerabilities"]
  m.reactions = strip_html_tags hash["Reactions"]
  m.user_id = 1

  m.save
end
