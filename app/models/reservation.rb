class Reservation < ApplicationRecord
    validates :check_in, presence: true
    validates :check_out, presence: true
    validates :people, presence: true
    validates :people, numericality: {greater_than_or_equal_to: 1}
    validate :start_end_check
    validate :date_before_start

    def start_end_check
      if not check_in.blank? || check_out.blank?
        errors.add(:check_out, "日はチェックイン日より前の日付は登録できません。") unless
        self.check_in < self.check_out
      end
    end
    def date_before_start
        if not check_in.blank?
            errors.add(:check_in, "日は今日以降のものを選択してください") unless
            self.check_in > Date.today
        end
    end

    belongs_to :user
    belongs_to :room
end
