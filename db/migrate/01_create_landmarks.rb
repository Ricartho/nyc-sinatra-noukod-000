class CreateLandmarks < ActiveRecord::Migration
  #raise 'Write CreateLandmarks migration here'
  def change
    create_table :figures do |el|
      el.string :name
    end

    create_table :landmarks do |el|
      el.belongs_to :figure, index: true
      el.string :name
      el.integer :year_completed
    end

    create_table :titles do |el|
      el.string :name
    end

    create_table :figure_titles do |el|
      el.belongs_to :title
      el.belongs_to :figure
    end

  end
end
