# Projeto 'teste'

Em processo de aprendizado. Vendo as opções existentes para criar um README resumido e também praticando os comandos do git.

> Projeto 1

> Projeto 2

> Projeto 3

> Projeto 4

> Projeto 5

```
 Projeto 1
 Projeto 2
 Projeto 3
 Projeto 4
 Projeto 5

```
```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```

```python
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```
```matlab
%http://www.public.asu.edu/~hhuang38/matlab_netcdf_guide.pdf
%https://www.mathworks.com/help/matlab/examples/creating-plots-with-two-y-axes.html
ncid = netcdf.open('/stornext/online8/mcga/w.santos/TQ0299L064/MAY2015_24Z_12Z_NCEP.nc','NOWRITE');
varname = netcdf.inqVar(ncid,10) %numero 10 relacionado a variavel prec
whos data %verifica a grade e tempo
[dimname,dimlength]=netcdf.inqDim(ncid,0)
[dimname,dimlength]=netcdf.inqDim(ncid,1)
[dimname,dimlength]=netcdf.inqDim(ncid,3)
precMay = netcdf.getVar(ncid,10,[0 0 0],[900 450 1],'double')
lon1 = netcdf.getVar(ncid,0,0,900)
lat1 = netcdf.getVar(ncid,1,0,450)
for p = 1:900
  for q = 1:450
	if abs(precMay(p,q)) > 99
		precMay(p,q) = 0;
	end
	map1(q,p) = precMay(p,q);
  end
end
pcolor(lon1,lat1,map1)
shading interp
colorbar
hold on
contour(lon1,lat1,map1,'k-')
```
```sh
export inctime=/home/smagnum/area_de_Trabalho/inctime/inctime
echo inctime=$inctime

```



- George Washington
- John Adams
- Thomas Jefferson

100. First list item
     - First nested list item

It's very easy to make some words **bold** and other words *italic* with Markdown. You can even [link to Google!](http://google.com)

First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column


| Command | Description |
| --- | --- |
| git status | List all new or modified files |
| git diff | Show file differences that haven't been staged |


- [ ] grib2prev-bin-ctl 
- [ ] template 
- [ ] bin for mask 
- [ ] bin for eqts 
- [ ] imerge global(data) 
- [ ] era-interim(data) 
- [x] dtaylor 
- [x] rms-bias
- [x] imagens
- [x] mascara
- [x] series
- [x] eqts


This site was built using [GitHub Pages](https://teste/)
