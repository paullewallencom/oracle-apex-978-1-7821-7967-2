/*************************************************************
** Name: 9672_09_02.sql                                     **
** Author: M. van der Plas                                  **
** Date: 26th October 2010                                  **
** This script executes a select statement that             **
** queries on the app_customers table                       **
**                                                          **
*************************************************************/
Select cust_first_name
,           cust_last_name
,           cust_street_address1
,           cust_postal_code || ' ' || cust_city “city”
,           cust_state
From app_customers
