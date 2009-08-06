module PostgresMigrationHelper
  def add_foreign_key(from_table, from_column, to_table, options = {})
    constraint_name = "fk_#{from_table}_#{from_column}"

    sql= %{ALTER TABLE #{from_table}
              ADD CONSTRAINT #{constraint_name}
              FOREIGN KEY (#{from_column})
              REFERENCES #{to_table}(id)
              ON UPDATE RESTRICT}
    sql << " ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED" if options[:cascade_delete]
    execute sql
  end

  def remove_foreign_key(from_table, from_column, to_table)
    constraint_name = "fk_#{from_table}_#{from_column}"

    execute %{ALTER TABLE #{from_table}
              DROP CONSTRAINT #{constraint_name}}
  end

  #Adds a UNIQUE CONSTRAINT on a number of fields
  # eg. add_unique_constraint(users, table1_id, table2_id, table3_id)
  def add_unique_constraint(from_table, *fields)
    constraint_name = "#{from_table}_unique_on_#{fields.join('_')}"
    constraint_name = "#{from_table}_unique_on_#{fields.join('_')}" if constraint_name.length > 60

    sql = %{ALTER TABLE #{from_table}
              ADD CONSTRAINT #{constraint_name}
                UNIQUE (#{fields.join(',')})
              }
    execute sql
  end

  def remove_unique_constraint(from_table, *fields)
    constraint_name = "#{from_table}_unique_on_#{fields.join('_')}"
    constraint_name = "#{from_table}_unique_on_#{fields.join('_')}" if constraint_name.length > 60

    execute %{ALTER TABLE #{from_table}
              DROP CONSTRAINT #{constraint_name}}
  end

  def set_mandatory_column(table, column)
    execute %{ALTER TABLE #{table}
               ALTER COLUMN #{column} SET NOT NULL}
  end

  def unset_mandatory_column(table, column)
    execute %{ALTER TABLE #{table}
               ALTER COLUMN #{column} DROP NOT NULL}
  end
end
ActiveRecord::ConnectionAdapters::AbstractAdapter.send :include, PostgresMigrationHelper
