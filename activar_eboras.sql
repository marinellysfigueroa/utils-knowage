INSERT INTO esquema.tb_ebrs_analytics_tenant(tenant_name,scheme, url_connection) VALUES ('base', 'base', 'jdbc:postgresql://InfobrightSQL:5029/detektor_analytics');

INSERT INTO esquema.tb_ebrs_analytics_config (fk_mast_id,fk_tenant_id) select  fk_mast_id,fk_tenant_id from ( select pk_mast_id as fk_mast_id from esquema.tb_ebrs_master where lower(mast_login)=lower('base'))usuario,( select pk_analytics_tenant_id as fk_tenant_id from esquema.tb_ebrs_analytics_tenant where tenant_name='base')tenant;

INSERT INTO esquema.tb_ebrs_master_profile (mtpf_product, fk_mast_id, fk_prfl_id, mtpf_login_register, mtpf_date_register,mtpf_login_create)  select 'btn-product-analytics',pk_mast_id,4,'admin',now(),'admin' as fk_mast_id from esquema.tb_ebrs_master where lower(mast_login)=lower('base');