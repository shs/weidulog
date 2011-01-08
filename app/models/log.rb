class Log < ActiveRecord::Base
  belongs_to :game
  has_one :content, :class_name => 'LogContent'
  has_and_belongs_to_many :mods
  has_and_belongs_to_many :mod_components, :class_name => 'Mod::Component'
  has_and_belongs_to_many :mod_versions, :class_name => 'Mod::Version'

  accepts_nested_attributes_for :content

  after_save :parse_mods, :calculate_counts

  private
    def parse_mods
      mods.clear

      content.body.each_line do |line|
        matches = line.match(content.regex)

        if matches
          mod_name, component_number, component_label, mod_version = matches[1..4]

          mod       = Mod.find_or_create_by_tp2_name(mod_name)
          component = mod.components.find_or_create_by_number_and_label(component_number, component_label)
          version   = mod.versions.find_or_create_by_number(mod_version)

          mods           << mod       unless mod_ids.include?(mod.id)
          mod_components << component unless mod_component_ids.include?(component.id)
          mod_versions   << version   unless mod_version_ids.include?(version.id)
        end
      end
    end

    def calculate_counts
      Log.update_all({:mod_count => mods.count, :mod_component_count => mod_components.count}, {:id => id})
    end
end
