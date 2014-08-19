class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      validates :email, uniqueness: { case_sensitive: false}
      validates :password, length: {minimum: 8}, if: :strong?
      def strong?
    password =~ /.*\d+.*/ && \
    password =~ /.*[a-z]+.*/ && \
    password =~ /.*[A-Z].*/
     end
      validates :name, presence: true
      t.text :blurb

      t.timestamps
    end
  end
end
