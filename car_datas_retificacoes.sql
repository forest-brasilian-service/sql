create table proc_sfb.datas_alta_floresta_rets as

select datas.idt_imovel,datas.versoes,datas.cod_imovel,datas.dat_cadastro,datas.dat_ult_ret,geo_area_imovel as geom from

(
SELECT 
max(idt_imovel) as idt_imovel,
count(idt_imovel) as versoes,
 cod_imovel,
 min(dat_criacao) as dat_cadastro,
 max(dat_criacao) as dat_ult_ret
FROM 
  usr_geocar_aplicacao.imovel
  where  
  
  ----imovel.idt_imovel in (6521694,5277183)
  idt_municipio = 5100250
  group by
  cod_imovel) datas,

  
  usr_geocar_aplicacao.imovel
  where
  datas.idt_imovel = imovel.idt_imovel
