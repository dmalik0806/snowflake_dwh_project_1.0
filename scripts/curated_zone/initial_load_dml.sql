/*
=======================================================================
Initial load scripts to ingest data in curated_zone schema tables
=======================================================================
*/
insert into curated_zone.curated_customer (
      customer_id ,
      salutation ,
      first_name ,
      last_name ,
      birth_day ,
      birth_month ,
      birth_year ,
      birth_country ,
      email_address ) 
    select 
      customer_id ,
      salutation ,
      first_name ,
      last_name ,
      birth_day ,
      birth_month ,
      birth_year ,
      birth_country ,
      email_address 
    from landing_zone.landing_customer;

insert into curated_zone.curated_item (
        item_id,
        item_desc,
        start_date,
        end_date,
        price,
        item_class,
        item_category) 
    select 
        item_id,
        item_desc,
        to_date(start_date,'DD-MM-YYYY') as start_date,
        to_date(end_date,'DD-MM-YYYY') end_date,
        price,
        item_class,
        item_category
    from landing_zone.landing_item;

insert into curated_zone.curated_order (
      order_date ,
      order_time ,
      item_id ,
      item_desc ,
      customer_id ,
      salutation ,
      first_name ,
      last_name ,
      store_id ,
      store_name ,
      order_quantity ,
      sale_price ,
      disount_amt ,
      coupon_amt ,
      net_paid ,
      net_paid_tax ,
      net_profit) 
    select 
      order_date ,
      order_time ,
      item_id ,
      item_desc ,
      customer_id ,
      salutation ,
      first_name ,
      last_name ,
      store_id ,
      store_name ,
      order_quantity ,
      sale_price ,
      disount_amt ,
      coupon_amt ,
      net_paid ,
      net_paid_tax ,
      net_profit  
  from landing_zone.landing_order;
