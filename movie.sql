create table movie (
					   movie_id int primary key,                
					   title varchar,                    
					   year  int,                
					   decade varchar,             
					   genre varchar,                
					   runtime_min int,                   
					   budget_usd decimal,                 
					   revenue_usd decimal,                
					   profit_usd decimal,              
					   roi decimal,                
					   rating decimal,                 
					   vote_count int,               
					   popularity decimal,               
					   blockbuster int                  
					);
					
select * from movie;

select
	genre,
	count(*)
	from movie
	group by genre;

select 
	genre,
	sum(revenue_usd)
	from movie
	group by genre
	order by sum(revenue_usd) desc;
	
select
	blockbuster,
	round(avg(rating), 2) as avg_rating
	from movie
	group by blockbuster;

select 
	title,
	year,
	genre,
	profit_usd,
	runtime_min
	from movie
	order by profit_usd desc limit 5;

select 
	decade,
	count(*),
	round(avg(roi), 2)
	from movie
	group by decade 
	order by round(avg(roi), 2) desc;


select 
	title,
	year,
	genre,
	profit_usd,
	runtime_min
	from movie
	where profit_usd<0;

select 
	genre,
	count(*)
	from movie
	where profit_usd<0
	group by genre;
	
select
	decade,
	sum(budget_usd),
	sum(revenue_usd),
	sum(profit_usd),
	sum(blockbuster)
	from movie
	group by decade
	
select 
	case
		hen bwudget_usd < 10000000 then 'Min_budget'
		when budget_usd between 10000000 and 50000000 then 'Median_budget' 
		else 'Max_budget'
		end as budget_category,
		round(avg(rating), 2) as avg_rating,
		round(avg(popularity), 2) as avg_popularity,
		count(*) as movie_count
	from movie
	group by budget_category
	order by avg_rating desc;
		
select 
	genre,
	round(avg(roi), 2) as average_roi,
	count(*) as total_movies
	from movie
	group by genre 
	order by average_roi desc;
	
select 
	title,
	genre,
	rating,
	popularity,
	vote_count
	from movie
	order by vote_count desc
	limit 10;

with ranked_movies as(
					select
						title,
						genre,
						profit_usd,
						rating,
						row_number() over(partition by genre  order by profit_usd desc) as rn
					from movie	
)
select 
	genre,
	title as best_movie,
	profit_usd,
	rating
	from ranked_movies
	where rn=1
	order by profit_usd  desc


select 
	case
		when runtime_min < 90 then 'Short (<90 min)'
		when runtime_min between 90 and 120 then 'Medium (90-120 min)'
		else 'Long(>120 min)'
		end as Film_duration,
		count(*) as total_movies,
		round(avg(rating), 2) as avg_rating,
		round(avg(profit_usd), 2) as avg_profit
	from movie
	group by film_duration
	order by avg_profit desc;
		

select
	decade,
	max(vote_count),
	sum(vote_count)
	from movie
	group by decade;
















