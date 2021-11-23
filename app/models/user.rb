class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :relationships_as_padawan, class_name: "Relationships", foreign_key: :padawan_id
  has_many :relationships_as_mentor, class_name: "Relationships", foreign_key: :mentor_id

  has_many :relation_sent, class_name: 'Relationship',
                           foreign_key: 'padawan_id',
                           inverse_of: 'padawan',
                           dependent: :destroy

  has_many :relation_request, class_name: 'Relationship',
                              foreign_key: 'mentor_id',
                              inverse_of: 'mentor',
                              dependent: :destroy

  has_many :connected, -> { merge(Relationship.connected) },
           through: :relation_sent, source: :mentor
  has_many :pending, -> { merge(Relationship.pending) },
           through: :relation_sent, source: :mentor
  has_many :not_connected, -> { merge(Relationship.not_connected) },
           through: :relation_request, source: :padawan

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :missions_as_mentor, class_name: "Mission", foreign_key: :mentor_id
  has_many :missions_as_padawan, class_name: "Mission", foreign_key: :padawan_id

  scope :mentor, -> { where(mentor: true) }
end
