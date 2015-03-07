module ApplicationHelper
  def with_format(format, &block)
    old_formats = formats
    begin
      self.formats = [format]
      return block.call
    ensure
      self.formats = old_formats
    end
  end

  def error_messages_for(model)
    model.errors.any? or return

    haml_tag :div, class: "alert alert-danger", role: alert do
      haml_tag :p, "#{pluralize(model.errors.count, "error")} prohibited this #{model.class.to_s.downcase} from being saved:"
      haml_tag :ul do
        model.errors.full_messages.each do |msg|
          haml_tag :li, msg
        end
      end
    end
  end
end
