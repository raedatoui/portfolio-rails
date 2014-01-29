module Draftable
  extend ActiveSupport::Concern

  included do

    belongs_to :publisher, class_name: "AdminUser", foreign_key: "publisher_id"

    # before_save :set_attributes_changed

    state_machine :published_state, initial: :draft do

      after_transition any => :published do |draftable, transition|
        # draftable.publish_public_attributes
      end

      after_transition :draft => :published do |draftable, transition|
        draftable.touch :published_at
      end

      before_transition :published => :draft do |draftable, transition|
        draftable.published_at = nil
        # draftable.node_publisher = nil
        # draftable.public_attributes = {}
      end

      event :republish do
        transition :published => :published
      end

      event :publish do
        transition :draft => :published
      end

      event :unpublish do
        transition :published => :draft
      end

    end

  end

end

