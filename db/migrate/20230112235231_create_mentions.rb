class CreateMentions < ActiveRecord::Migration[7.0]
  def change
    create_table :mentions do |t|
      t.references :mentioning_report, null: false, foreign_key: { to_table: :reports }
      t.references :mentioned_report, null: false, foreign_key: { to_table: :reports }
      t.index %i[mentioned_report_id mentioning_report_id], unique: true

      t.timestamps
    end
  end
end
