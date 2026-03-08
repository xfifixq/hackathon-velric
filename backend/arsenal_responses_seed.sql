-- ============================================================
-- GreenPulse — Arsenal FC Assessment Responses Seed
-- Pre-populated assessment for Arsenal Football Club
-- ============================================================

-- Create Arsenal FC company profile
INSERT INTO company_profiles (id, company_name, industry, company_size, location)
VALUES ('11111111-1111-1111-1111-111111111111', 'Arsenal Football Club', 'Sports', '501-1000', 'London, United Kingdom')
ON CONFLICT (id) DO UPDATE SET company_name = EXCLUDED.company_name;

-- Insert Arsenal assessment responses
-- Each department has 25 questions (question_numbers 1-25)
-- Scores represent Arsenal FC's current green skills maturity

-- R&D Department Responses
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 1
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 2
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 3
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 3
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 4
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 4
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 5
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 6
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 4
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 7
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 3
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 8
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 9
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 10
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 11
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 12
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 4
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 13
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 3
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 14
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 15
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 16
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 17
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 4
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 18
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 3
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 19
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 20
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 21
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 22
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 4
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 23
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 3
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 24
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'R&D' AND aq.question_number = 25
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;

-- Marketing Department Responses
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 1
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 2
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 3
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 4
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 5
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 6
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 7
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 8
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 9
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 10
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 11
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 12
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 13
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 14
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 15
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 3
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 16
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 17
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 18
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 19
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 20
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 21
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 22
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 23
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 24
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Marketing' AND aq.question_number = 25
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;

-- IT Department Responses
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 1
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 2
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 3
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 4
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 5
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 6
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 7
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 8
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 9
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 10
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 11
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 12
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 13
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 14
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 15
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 16
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 17
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 18
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 19
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 20
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 21
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 22
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 23
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 24
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'IT' AND aq.question_number = 25
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;

-- Finance Department Responses
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 1
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 2
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 3
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 4
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 5
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 6
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 7
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 8
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 9
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 10
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 11
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 12
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 13
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 14
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 15
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 16
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 17
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 18
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 19
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 20
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 21
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 22
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 23
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 24
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Finance' AND aq.question_number = 25
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;

-- Legal Department Responses
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 1
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 2
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 3
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 4
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 5
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 6
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 7
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 8
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 9
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 10
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 11
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 12
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 13
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 14
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 15
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 3
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 16
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 17
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 18
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 19
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 20
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 21
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 22
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 23
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 24
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Legal' AND aq.question_number = 25
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;

-- Supply Chain Department Responses
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 1
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 2
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 3
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 4
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 5
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 6
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 7
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 8
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 9
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 10
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 11
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 12
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 13
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 14
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 15
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 16
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 17
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 18
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 19
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 20
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 21
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 22
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 23
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 24
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Supply Chain' AND aq.question_number = 25
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;

-- HR Department Responses
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 1
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 2
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 3
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 4
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 5
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 6
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 7
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 8
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 9
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 10
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 11
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 12
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 13
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 14
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 15
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 16
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 17
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 18
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 19
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 20
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 21
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 22
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 23
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 24
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'HR' AND aq.question_number = 25
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;

-- CxO Department Responses
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 3
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 1
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 2
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 3
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 4
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 5
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 6
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 7
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 8
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 9
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 10
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 11
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 12
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 13
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 14
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 15
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 16
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 17
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 18
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 19
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 20
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 21
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 22
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 23
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 24
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'CxO' AND aq.question_number = 25
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;

-- Operations Department Responses
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 1
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 2
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 3
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 4
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 5
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 6
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 7
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 8
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 9
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 10
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 11
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 12
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 13
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 14
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 15
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 16
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 17
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 18
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 19
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 20
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 21
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 22
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 23
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 24
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Operations' AND aq.question_number = 25
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;

-- Procurement Department Responses
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 1
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 2
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 3
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 4
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 5
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 6
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 7
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 8
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 9
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 10
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 11
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 12
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 13
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 14
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 15
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 16
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 17
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 18
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 19
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 20
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 21
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 22
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 2
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 23
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 24
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
INSERT INTO assessment_responses (company_id, question_id, score)
SELECT '11111111-1111-1111-1111-111111111111', aq.id, 1
FROM assessment_questions aq
WHERE aq.department = 'Procurement' AND aq.question_number = 25
ON CONFLICT (company_id, question_id) DO UPDATE SET score = EXCLUDED.score;
