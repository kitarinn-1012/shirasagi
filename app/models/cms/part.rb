class Cms::Part
  include Cms::Model::Part
  include Cms::PluginRepository
  include Multilingual::Addon::Part

  index({ site_id: 1, filename: 1 }, { unique: true })

  plugin_type "part"

  class Base
    include Cms::Model::Part

    default_scope ->{ where(route: /^cms\//) }
  end

  class Free
    include Cms::Model::Part
    include Cms::Addon::Html
    include Cms::Addon::Release
    include Cms::Addon::GroupPermission
    include History::Addon::Backup
    include Multilingual::Addon::Part

    default_scope ->{ where(route: "cms/free") }
  end

  class Node
    include Cms::Model::Part
    include Cms::Addon::NodeList
    include Cms::Addon::Release
    include Cms::Addon::GroupPermission
    include History::Addon::Backup
    include Multilingual::Addon::Part

    default_scope ->{ where(route: "cms/node") }
  end

  class Page
    include Cms::Model::Part
    include Cms::Addon::PageList
    include Cms::Addon::Release
    include Cms::Addon::GroupPermission
    include History::Addon::Backup
    include Multilingual::Addon::Part

    default_scope ->{ where(route: "cms/page") }
  end

  class Tabs
    include Cms::Model::Part
    include Cms::Addon::Tabs
    include Cms::Addon::Release
    include Cms::Addon::GroupPermission
    include History::Addon::Backup
    include Multilingual::Addon::Part

    default_scope ->{ where(route: "cms/tabs") }
  end

  class Crumb
    include Cms::Model::Part
    include Cms::Addon::Crumb
    include Cms::Addon::Release
    include Cms::Addon::GroupPermission
    include History::Addon::Backup
    include Multilingual::Addon::Part

    default_scope ->{ where(route: "cms/crumb") }

    # Cms::Addon::Crumb
    show_foreign_addon Cms::Addon::Crumb
    foreign_field :home_label
  end

  class SnsShare
    include Cms::Model::Part
    include Cms::Addon::SnsShare
    include Cms::Addon::Release
    include Cms::Addon::GroupPermission
    include History::Addon::Backup
    include Multilingual::Addon::Part

    default_scope ->{ where(route: "cms/sns_share") }
  end

  class CalendarNav
    include Cms::Model::Part
    include Cms::Addon::Release
    include Cms::Addon::GroupPermission
    include History::Addon::Backup
    include Multilingual::Addon::Part

    default_scope ->{ where(route: "cms/calendar_nav") }
  end

  class MonthlyNav
    include Cms::Model::Part
    include Cms::Addon::MonthlyNav
    include Cms::Addon::Release
    include Cms::Addon::GroupPermission
    include History::Addon::Backup
    include Multilingual::Addon::Part

    default_scope ->{ where(route: "cms/monthly_nav") }
  end
end
