module App
  # Return an array page object classes, based on files found in
  # features/pages
  def self.page_classes
    Pathname.glob(Pathname.new(__dir__).join('*.rb'))
            .map {|p| p.basename('.rb').to_s }
            .select {|p| p != 'app' }
            .map {|p| p.classify.constantize }
  end

  # Define class method to return a memoized page object. For example:
  #
  #   define_page_object_method ShowGame
  #
  #   respond_to? :show_game    => true
  #   show_game.is_a?(ShowGame) => true
  #
  def self.define_page_object_method(page_klass)
    name = page_klass.to_s.underscore

    eigen = class << self; self; end
    eigen.send(:define_method, page_klass.to_s.underscore) do

      unless instance_variable_get("@#{name}")
        i = page_klass.new
        instance_variable_set "@#{name}", i
      end

      instance_variable_get "@#{name}"
    end
  end

  # build class methods
  page_classes.each {|k| define_page_object_method k }
end
