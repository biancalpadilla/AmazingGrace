class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true

  def self.tagged_with(name)
    Tag.find_by_name!(name).questions
  end

  def self.tag_counts
    Tag.select("tags.id, tags.name,count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

    def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
      end
    end

    def self.search(search)
    where("title ilike :search or description ilike :search or tags.name ilike :search ", {:search => "%#{search}%" })
  end
end
