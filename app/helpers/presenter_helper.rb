module PresenterHelper
  def present(object, klass = nil)
    klass ||= "#{ object.class }Presenter".constantize
    presenter = klass.new(object: object, view_template: self)
    yield presenter if block_given?
    presenter
  end

  def nested_menu_items(menu_items:, depth: 1)
    menu_items.map do |menu_item, sub_menu_items|
      render partial: "menu_items/menu_item",
             locals: { menu_item_presenter: MenuItemPresenter.new(object: menu_item, view_template: self, descendants_hash: sub_menu_items),
                       sub_menu_items: sub_menu_items, depth: depth
                     }
    end.join.html_safe
  end

  def header_menu_items(menu_items:, depth: 1)
    menu_items.map do |menu_item, sub_menu_items|
      render partial: "menu_items/header_menu_item",
             locals: { menu_item_presenter: MenuItemPresenter.new(object: menu_item, view_template: self, descendants_hash: sub_menu_items),
                       sub_menu_items: sub_menu_items, depth: depth
                     }
    end.join.html_safe
  end

  def child_menu_items(menu_items:, depth: 1)
    menu_items.map do |menu_item, sub_menu_items|
      render partial: "menu_items/child_menu_item",
             locals: { menu_item_presenter: MenuItemPresenter.new(object: menu_item, view_template: self, descendants_hash: sub_menu_items),
                      sub_menu_items: sub_menu_items, depth: depth
                    }
   end.join.html_safe
  end

  def page_sidebar_menu_items(menu_items: , depth: 0)
    menu_items.map do |menu_item, sub_menu_items|
      render(
        partial: "pages/shared/menu_item",
        locals: {
          menu_item_presenter: MenuItemPresenter.new(object: menu_item, view_template: self, descendants_hash: sub_menu_items),
          depth: depth,
          menu_item: menu_item,
          sub_menu_items: sub_menu_items
        }
      )
    end.join.html_safe
  end
end
