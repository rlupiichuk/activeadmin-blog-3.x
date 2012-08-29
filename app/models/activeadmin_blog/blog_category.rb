class ActiveadminBlog::BlogCategory
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include Mongoid::Reorder

  # Fields
  field :name
  field :_position, :type => Float, :default => 0.0

  # Validations
  validates_presence_of :name
  validates_uniqueness_of :name

  # Features
	slug :name, :permanent => true
  
  # Relations
  has_and_belongs_to_many :blog_posts, :class_name => "ActiveadminBlog::BlogPost"

  # Scope
  default_scope order_by(:_position => :desc)

  # Class methods
  def self.find_by_slug(slug)
    find_by(slug: slug)
  end

end