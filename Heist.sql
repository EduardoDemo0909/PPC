CREATE EXTENSION pgcrypto;

UPDATE users SET token = gen_random_uuid() WHERE token IS NULL;


ALTER TABLE users ADD COLUMN token UUID;

ALTER TABLE users ADD COLUMN verification_code VARCHAR(10);
ALTER TABLE users ADD COLUMN email_verified BOOLEAN DEFAULT FALSE;




CREATE TABLE users(
    id serial primary key,
    user_name VARCHAR (500) not null unique,
    ip INET,
    email VARCHAR (500) not null unique,
    password VARCHAR(255) NOT NULL,  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Função para o gatilho
CREATE OR REPLACE FUNCTION update_created_at()
RETURNS TRIGGER AS $$
BEGIN
    -- Contar o número de linhas existentes na tabela para determinar a posição
    NEW.created_at := (SELECT COUNT(*) + 1 FROM users) || '-' || TO_CHAR(NOW(), 'YYYY/MM/DD');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criação do gatilho
CREATE TRIGGER before_insert_users
BEFORE INSERT ON users
FOR EACH ROW
EXECUTE FUNCTION update_created_at();
DROP TRIGGER before_insert_users ON users;


///////////////////////////////////////////////////////////IP/////////////////////////////////////////////////////
CREATE OR REPLACE FUNCTION generate_unique_ip()
RETURNS TRIGGER AS $$
DECLARE
    new_ip inet;
    ip_exists BOOLEAN;
BEGIN
    LOOP
        -- Gera um IP aleatório
        new_ip := (
            ROUND(random() * 255)::INT || '.' ||
            ROUND(random() * 255)::INT || '.' ||
            ROUND(random() * 255)::INT || '.' ||
            ROUND(random() * 255)::INT
        )::inet;

        -- Verifica se o IP já existe na tabela
        SELECT EXISTS (SELECT 1 FROM users WHERE ip = new_ip) INTO ip_exists;

        -- Se o IP não existe, sai do loop
        EXIT WHEN NOT ip_exists;
    END LOOP;

    -- Define o IP gerado para o novo registro
    NEW.ip := new_ip;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


drop function generate_unique_ip


CREATE TRIGGER before_insert_users
BEFORE INSERT ON users
FOR EACH ROW
EXECUTE FUNCTION generate_unique_ip();



-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-- Função para incrementar o IP
CREATE OR REPLACE FUNCTION generate_unique_ip()
RETURNS TRIGGER AS $$
DECLARE
    last_ip VARCHAR(255);
    new_ip VARCHAR(255);
    num_part INT;
    char_part CHAR(4);
BEGIN
    -- Seleciona o último IP inserido na tabela
    SELECT ip INTO last_ip FROM users ORDER BY id DESC LIMIT 1;
    
    IF last_ip IS NULL THEN
        new_ip := '0000';
    ELSE
        num_part := COALESCE(NULLIF(regexp_replace(last_ip, '[^0-9]', '', 'g'), ''), '0')::INT;
        char_part := regexp_replace(last_ip, '[0-9]', '', 'g');
        
        IF char_part = '' THEN
            -- Incrementa a parte numérica
            num_part := num_part + 1;
            new_ip := LPAD(num_part::TEXT, 4, '0');
        ELSE
            -- Incrementa a parte alfabética se necessário
            IF num_part = 9999 THEN
                num_part := 0;
                char_part := increment_char_part(char_part);
                new_ip := char_part || LPAD(num_part::TEXT, 4, '0');
            ELSE
                num_part := num_part + 1;
                new_ip := char_part || LPAD(num_part::TEXT, 4, '0');
            END IF;
        END IF;
    END IF;

    NEW.ip := new_ip;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Função para incrementar a parte alfabética
CREATE OR REPLACE FUNCTION increment_char_part(char_part CHAR(4))
RETURNS CHAR(4) AS $$
DECLARE
    result CHAR(4) := char_part;
    i INT;
BEGIN
    FOR i IN REVERSE 1..4 LOOP
        IF SUBSTRING(result, i, 1) = 'Z' THEN
            result := OVERLAY(result PLACING 'A' FROM i FOR 1);
        ELSE
            result := OVERLAY(result PLACING CHR(ASCII(SUBSTRING(result, i, 1)) + 1) FROM i FOR 1);
            EXIT;
        END IF;
    END LOOP;
    RETURN result;
END;
$$ LANGUAGE plpgsql;

select * from users

-- Criação do gatilho
CREATE TRIGGER before_insert_users_trigger
BEFORE INSERT ON users
FOR EACH ROW
EXECUTE FUNCTION before_insert_users();




CREATE OR REPLACE FUNCTION generate_unique_token()
RETURNS TRIGGER AS $$
DECLARE
    new_token UUID;
BEGIN
    LOOP
        new_token := gen_random_uuid();
        IF NOT EXISTS (SELECT 1 FROM users WHERE token = new_token) THEN
            NEW.token := new_token;
            EXIT;
        END IF;
    END LOOP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_unique_token
BEFORE INSERT ON users
FOR EACH ROW
EXECUTE FUNCTION generate_unique_token();




--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO users (user_name, email, password) VALUES ('Edu', 'edu@gmail.com', 'password123');
INSERT INTO users (user_name, email, password) VALUES ('Stukov', 'stukov@gmail.com', 'password456');


delete from users where id = 11
truncate users

select * from users


SELECT usename FROM pg_user;
SELECT inet_server_addr();
SELECT client_addr
FROM pg_stat_activity
WHERE state = 'active';  -- Filtrar para conexões ativas
SHOW config_file;



