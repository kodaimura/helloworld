CREATE FUNCTION set_update_time() returns opaque AS '
	BEGIN
		new.update_at := ''now'';
		return new;
	END
' language 'plpgsql';


CREATE TABLE IF NOT EXISTS task (
	task_id SERIAL,
	task_name VARCHAR(100) NOT NULL,
	description VARCHAR(500),
	due_date VARCHAR(50),
	percentage INTEGER,
	create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(task_id)
);


CREATE TRIGGER trg_task_upd AFTER UPDATE ON task FOR EACH ROW
	execute procedure set_update_time();