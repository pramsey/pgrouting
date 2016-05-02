
\i setup.sql
-- TESTING DOCUMNETATIONS INFORMATION

set client_min_messages = ERROR;
SELECT plan(35);

-- RECEIVES 5 PARAMETERS

SELECT has_function('pgr_astar',ARRAY['text', 'integer', 'integer', 'boolean', 'boolean']);
SELECT function_returns('pgr_astar', 'setof pgr_costresult','Returns set of costResult[]');


-- CHECKING THE INNER QUERY



PREPARE q1 AS
SELECT * FROM pgr_astar(
    'SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table',
    2, 3, true, true);
SELECT lives_ok('q1', 'edges query accepts INTEGER & FLOAT');


-- some test pass because the code is not checking

SELECT todo_start();
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::BIGINT, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::SMALLINT, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::FLOAT8, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::REAL, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT todo_end();

SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::BIGINT, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::SMALLINT, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');

SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::BIGINT, cost::FLOAT, reverse_cost::FLOAT, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::SMALLINT, cost::FLOAT, reverse_cost::FLOAT, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');

SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::BIGINT, reverse_cost::FLOAT, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::INTEGER, reverse_cost::FLOAT, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::SMALLINT, reverse_cost::FLOAT, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::REAL, reverse_cost::FLOAT, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');

-- reverse_cost
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::BIGINT, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::INTEGER, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::SMALLINT, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::REAL, x1::FLOAT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');

SELECT todo_start();
-- x1
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, x1::BIGINT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, x1::INTEGER, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, x1::SMALLINT, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, x1::REAL, y1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');

-- x2
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, x2::BIGINT, y1::FLOAT, x1::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, x2::INTEGER, y1::FLOAT, x1::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, x2::SMALLINT, y1::FLOAT, x1::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, x2::REAL, y1::FLOAT, x1::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');


-- y1
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, y1::BIGINT, x1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, y1::INTEGER, x1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, y1::SMALLINT, x1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, y1::REAL, x1::FLOAT, x2::FLOAT, y2::FLOAT FROM edge_table'',
        2, 3, true, true)');

-- y2
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, y2::BIGINT, x1::FLOAT, x2::FLOAT, y1::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, y2::INTEGER, x1::FLOAT, x2::FLOAT, y1::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, y2::SMALLINT, x1::FLOAT, x2::FLOAT, y1::FLOAT FROM edge_table'',
        2, 3, true, true)');
SELECT throws_ok(
    'SELECT * FROM pgr_astar(
        ''SELECT id::INTEGER, source::INTEGER, target::INTEGER, cost::FLOAT, reverse_cost::FLOAT, y2::REAL, x1::FLOAT, x2::FLOAT, y1::FLOAT FROM edge_table'',
        2, 3, true, true)');
select todo_end();


SELECT finish();
ROLLBACK;
