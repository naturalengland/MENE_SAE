do $$ begin
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_age') then
        create type natural_england_mene_age as enum (
            '16-24', '25-34', '35-44', '45-54', '55-64', '65+');
    end if;
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_sex') then
        create type natural_england_mene_sex as enum ('Male', 'Female');
    end if;
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_yesno') then
        create type natural_england_mene_yesno as enum ('Yes', 'No');
    end if;
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_ethnicity') then
        create type natural_england_mene_ethnicity as enum ('White British', 'White Irish',
            'Any other white background', 'African', 'Caribbean', 'Any other Black background',
            'Indian', 'Pakistani', 'Bangladeshi', 'Chinese', 'Any other Asian backgrund',
            'Any other', 'White & Black African', 'White & Asian', 'White & Black Carib bean',
            'Any other mixed background', 'Refused');
    end if;
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_marital') then
        create type natural_england_mene_marital as enum (
           'NA', 'Married', 'Sep/Wid/div', 'Single');
    end if;
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_workstat') then
        create type natural_england_mene_workstat as enum (
             'At school', 'F/T hghr educ', 'Not seeking', 'P/T <8  hrs', 'P/T 8-29 hrs',
             'F/T 30+ hrs', 'Retired', 'Unemployed');
    end if;
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_workstat5') then
        create type natural_england_mene_workstat5 as enum (
             'In Education', 'Part time', 'Full time', 'Retired', 'Not working');
    end if;
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_seg') then
        create type natural_england_mene_seg as ENUM ('AB', 'C1', 'C2', 'DE');
    end if;
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_segall') then
        create type natural_england_mene_segall as ENUM ('A', 'B', 'C1', 'C2', 'D', 'E');
    end if;
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_lifestage') then
        create type natural_england_mene_lifestage as ENUM (
            'Young Independent', 'Older Independent', 'Family', 'Empty Nester');
    end if;
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_persons_in_hh') then
        create type natural_england_mene_persons_in_hh as ENUM ('1', '2', '3', '4', '5+');
    end if;
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_child_in_hh') then
         create type natural_england_mene_child_in_hh as enum('None', 'Any');
    end if;
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_tenure') then
        create type natural_england_mene_tenure as ENUM ('Rent local authority', 'Rent private',
            'Other', 'Mortgage', 'Owned outright');
    end if;
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_vbad_vgood') then
        create type natural_england_mene_vbad_vgood as ENUM (
            'Very bad', 'Bad', 'Fair', 'Good', 'Very good', 'Don''t know');
    end if;
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_likert5') then
      create type natural_england_mene_likert5 as ENUM ('Disagree', 'Strongly disagree',
          'Neither agree nor disagree', 'Agree', 'Strongly agree', 'Don''t know');
    end if;
    if not exists (select 1 from pg_type where typname = 'natural_england_mene_surveyyear') then
        create type natural_england_mene_surveyyear as ENUM (
            'Y0910', 'Y1011', 'Y1112', 'Y1213', 'Y1314', 'Y1415', 'Y1516', 'Y1617', 'Y1718');
    end if;
end $$;

-- biodiversity decline
-- variety
-- There will be no change to the variety of life

-- There will be less variety of life
-- There will be more variety of life
-- g2 new awareness of biodiversity decline


-- I have access to a private garden
--  I have access to a private communal garden
--  I don't have access to a garden
--  I have access to a private outdoor space but not a garden (balcony, yard, patio area)


-- Bad\poor weather
-- q18_02 Old age
-- q18_03 Poor health
-- q18_04 A physical disability
-- q18_05 Pregnant
-- q18_06 Having young children
-- q18_07 Having other caring responsibilities
-- q18_08 Too busy at home
-- q18_09 Too busy at work
-- q18_10 Not interested
-- q18_11 This isn’t something for me\ people like me
-- q18_12 Don’t like going out on my own
-- q18_13 Have no access to a car
-- q18_14 Lack of public transport
-- q18_15 Too expensive
-- q18_16 Prefer to do other leisure activities
-- q18_17 Worried about safety/ doesn’t feel safe
-- q18_18 Concerns about where I am allowed to go or access restrictions
-- q18_19 I don’t feel welcome\ feel out of place
-- q18_20 Lack of suitable places to go/ suitable paths
-- q18_21 Don’t know where to go\ lack of information
-- q18_23 No particular reason
-- q18_24 Don't Know

-- Spending time out of doors (including my own garden) is an important part of
-- my life
-- I am concerned about damage to the natural environment
-- There are many natural places I may never visit but I am glad they exist
-- Having open green spaces close to where I live is important


-- e3_01 Other participation - Watching or listening to nature programmes o

drop table if exists natural_england_mene_respondents;
create table natural_england_mene_respondents (
    id2 text,
    respondent_id text,
    interview_date date,
    survey_year natural_england_mene_surveyyear,
    age natural_england_mene_age,
    sex natural_england_mene_sex,
    ethnicity natural_england_mene_ethnicity,
    disability natural_england_mene_yesno,
    marital natural_england_mene_marital,
    workstat natural_england_mene_workstat,
    seg natural_england_mene_seg,
    segall natural_england_mene_segall,
    lifestage natural_england_mene_lifestage,
    physical int,
    adults_in_hh natural_england_mene_persons_in_hh,
    child_in_hh natural_england_mene_child_in_hh,
    nchild_in_hh int,
    hh_size natural_england_mene_persons_in_hh,
    tenure natural_england_mene_tenure,
    workstat5 natural_england_mene_workstat5,
    car natural_england_mene_yesno,
    dog natural_england_mene_yesno,
    general_health natural_england_mene_vbad_vgood,
    internet_access natural_england_mene_yesno,
    email natural_england_mene_yesno,
    wellbeing int,
    barriers_to_visits natural_england_mene_yesno[],
    attitudes_to_environment natural_england_mene_likert5[],
    activities_in_natural_environment natural_england_mene_yesno[],
    pro_environmental_attitudes natural_england_mene_yesno[],
    lifestyle_changes text,
    attitudes_to_local_greenspaces natural_england_mene_likert5[],
    has_garden text,
    attitude_to_garden natural_england_mene_yesno[],
    postcode text,
    geom geometry,
    survey_weights float[])
;

create or replace function staging.import_natural_england_mene_respondents() returns void
as $$
declare
begin
    truncate table natural_england_mene_respondents;
    insert into natural_england_mene_respondents (
            id2, respondent_id, interview_date, survey_year, age, sex,
            ethnicity, disability, marital, workstat, seg,
            segall, lifestage, physical, adults_in_hh, child_in_hh, nchild_in_hh, hh_size,
            tenure, workstat5, car, dog, general_health, internet_access, email, wellbeing,
            barriers_to_visits, attitudes_to_environment, activities_in_natural_environment,
            pro_environmental_attitudes, lifestyle_changes, attitudes_to_local_greenspaces,
            has_garden, attitude_to_garden, postcode, geom, survey_weights)
        with postcode_areas (postcode_area, geom) as (
            select substring(postcode, '^[a-zA-Z]+\d\d?[a-zA-Z]?\s*\d+') as postcode_area, geom
                from ons_postcode_directory_centroids),
        pca (postcode, geom) as (
            select postcode_area, st_centroid(st_union(geom)) as geom
                from postcode_areas
                group by postcode_area)
        select
            id2,
            respondentid,
            to_date(interviewdate, 'MM/DD/YYYY'),
            year::natural_england_mene_surveyyear,
            age::natural_england_mene_age,
            sex::natural_england_mene_sex,
            ethnicity::natural_england_mene_ethnicity,
            nullif(disability, ' ')::natural_england_mene_yesno,
            marital::natural_england_mene_marital,
            workstat::natural_england_mene_workstat,
            seg::natural_england_mene_seg,
            segall::natural_england_mene_segall,
            lifestage::natural_england_mene_lifestage,
            nullif(physical, ' ')::int,
            adults_in_hh::natural_england_mene_persons_in_hh,
            child_in_hh::natural_england_mene_child_in_hh,
            nullif(nchild_in_hh, ' ')::int,
            hh_size::natural_england_mene_persons_in_hh,
            tenure::natural_england_mene_tenure,
            workstat5::natural_england_mene_workstat5,
            nullif(car, ' ')::natural_england_mene_yesno,
            nullif(dog, ' ')::natural_england_mene_yesno,
            nullif(generalhealth, ' ')::natural_england_mene_vbad_vgood,
            internetaccess::natural_england_mene_yesno,
            email::natural_england_mene_yesno,
            substring(wellbeing1, '^[\d]')::int,
            array[nullif(q18_01, ' ')::natural_england_mene_yesno,
                  nullif(q18_02, ' ')::natural_england_mene_yesno,
                  nullif(q18_03, ' ')::natural_england_mene_yesno,
                  nullif(q18_04, ' ')::natural_england_mene_yesno,
                  nullif(q18_05, ' ')::natural_england_mene_yesno,
                  nullif(q18_06, ' ')::natural_england_mene_yesno,
                  nullif(q18_07, ' ')::natural_england_mene_yesno,
                  nullif(q18_08, ' ')::natural_england_mene_yesno,
                  nullif(q18_09, ' ')::natural_england_mene_yesno,
                  nullif(q18_10, ' ')::natural_england_mene_yesno,
                  nullif(q18_11, ' ')::natural_england_mene_yesno,
                  nullif(q18_12, ' ')::natural_england_mene_yesno,
                  nullif(q18_13, ' ')::natural_england_mene_yesno,
                  nullif(q18_14, ' ')::natural_england_mene_yesno,
                  nullif(q18_15, ' ')::natural_england_mene_yesno,
                  nullif(q18_16, ' ')::natural_england_mene_yesno,
                  nullif(q18_17, ' ')::natural_england_mene_yesno,
                  nullif(q18_18, ' ')::natural_england_mene_yesno,
                  nullif(q18_19, ' ')::natural_england_mene_yesno,
                  nullif(q18_20, ' ')::natural_england_mene_yesno,
                  nullif(q18_21, ' ')::natural_england_mene_yesno,
                  nullif(q18_23, ' ')::natural_england_mene_yesno,
                  nullif(q18_24, ' ')::natural_england_mene_yesno],
            array[nullif(regexp_replace(e2_1, '\[\d\]\ ', ''), ' ')::natural_england_mene_likert5,
                  nullif(regexp_replace(e2_2, '\[\d\]\ ', ''), ' ')::natural_england_mene_likert5,
                  nullif(regexp_replace(e2_3, '\[\d\]\ ', ''), ' ')::natural_england_mene_likert5,
                  nullif(regexp_replace(e2_4, '\[\d\]\ ', ''), ' ')::natural_england_mene_likert5],
            array[nullif(e3_01, ' ')::natural_england_mene_yesno,
                  nullif(e3_02, ' ')::natural_england_mene_yesno,
                  nullif(e3_03, ' ')::natural_england_mene_yesno,
                  nullif(e3_04, ' ')::natural_england_mene_yesno,
                  nullif(e3_05, ' ')::natural_england_mene_yesno,
                  nullif(e3_06, ' ')::natural_england_mene_yesno,
                  nullif(e3_07, ' ')::natural_england_mene_yesno,
                  nullif(e3_08, ' ')::natural_england_mene_yesno,
                  nullif(e3_09, ' ')::natural_england_mene_yesno,
                  nullif(e3_10, ' ')::natural_england_mene_yesno],
            array[nullif(e4_1, ' ')::natural_england_mene_yesno,
                  nullif(e4_2, ' ')::natural_england_mene_yesno,
                  nullif(e4_3, ' ')::natural_england_mene_yesno,
                  nullif(e4_4, ' ')::natural_england_mene_yesno,
                  nullif(e4_5, ' ')::natural_england_mene_yesno,
                  nullif(e4_6, ' ')::natural_england_mene_yesno,
                  nullif(e4_7, ' ')::natural_england_mene_yesno,
                  nullif(e4_8, ' ')::natural_england_mene_yesno,
                  nullif(e4_9, ' ')::natural_england_mene_yesno,
                  nullif(e4_10, ' ')::natural_england_mene_yesno,
                  nullif(e4_11, ' ')::natural_england_mene_yesno,
                  nullif(e4_12, ' ')::natural_england_mene_yesno],
                  nullif(e5, ' '),
            array[nullif(regexp_replace(e6_01, '\[\d\]\ ', ''), ' ')::natural_england_mene_likert5,
                  nullif(regexp_replace(e6_02, '\[\d\]\ ', ''), ' ')::natural_england_mene_likert5,
                  nullif(regexp_replace(e6_03, '\[\d\]\ ', ''), ' ')::natural_england_mene_likert5],
             nullif(e7, ' ')::text,
             array[nullif(e8_01, ' ')::natural_england_mene_yesno,
                   nullif(e8_02, ' ')::natural_england_mene_yesno,
                   nullif(e8_03, ' ')::natural_england_mene_yesno,
                   nullif(e8_04, ' ')::natural_england_mene_yesno,
                   nullif(e8_05, ' ')::natural_england_mene_yesno,
                   nullif(e8_06, ' ')::natural_england_mene_yesno,
                   nullif(e8_07, ' ')::natural_england_mene_yesno,
                   nullif(e8_08, ' ')::natural_england_mene_yesno,
                   nullif(e8_09, ' ')::natural_england_mene_yesno,
                   nullif(e8_10, ' ')::natural_england_mene_yesno,
                   nullif(e8_11, ' ')::natural_england_mene_yesno,
                   nullif(e8_12, ' ')::natural_england_mene_yesno,
                   nullif(e8_13, ' ')::natural_england_mene_yesno,
                   nullif(e8_14, ' ')::natural_england_mene_yesno,
                   nullif(e8_15, ' ')::natural_england_mene_yesno,
                   nullif(e8_16, ' ')::natural_england_mene_yesno,
                   nullif(e8_17, ' ')::natural_england_mene_yesno],
             postcode,
             geom,
             array[weekweightannual, monthweightannual, quarterweightannual,
                  converted_weekweightannual, converted_monthweightannual,
                  converted_quarterweightannual, weekweightcumulative,
                  monthweightcumulative, quarterweightcumulative,
                  laweighty4phof, laweighty1y3phof, laweighty1weekly,
                  laweighty2weekly, laweighty3weekly, laweighty4weekly,
                  laweighty5weekly, laweighty6weekly, laweighty7weekly, laweighty1y7weekly,
                  laweightweeklyy1y7monthly]
             from staging.natural_england_mene_respondents_y1_9
             left join pca
             on residence_postcode_sector = postcode
    ;
end
$$ language plpgsql;
