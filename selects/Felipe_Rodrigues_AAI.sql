/*
Aluno: FELIPE RODRIGUES
*/

1)

SELECT 	SUM(pib) AS Total_PIB
FROM	pais
WHERE	YEAR(dt_indep) > 1920
AND		renda_percapta <= 1000.00
OR		codgrupo = 2;

2)

SELECT 	MIN(p.pib) AS Menor_PIB
FROM	pais p INNER JOIN continente c
on		p.codcontinente = c.codcontinente
WHERE	c.continente IN ('africa','asia')
AND		p.renda_percapta < 150;

3)

SELECT	pais,
		(pib / qtde_hab) AS PIBXQTDEHAB
FROM	pais;

4)

SELECT 	pais,
		(renda_percapta * qtde_hab) AS PercXQtdeHab
FROM	pais
WHERE	(renda_percapta * qtde_hab) < 10000000.00;

5)

SELECT	p.codpais,
		p.pais,
		g.grupo,
		(p.pib - p.qtde_hab) AS Pib_QtdeHab
FROM	pais p INNER JOIN grupo g
ON		p.codgrupo = g.codgrupo
WHERE	g.grupo IN('mercosul', 'outros');

6)

SELECT	AVG(qtde_hab) AS Media_Habitantes
FROM	pais
WHERE	dt_indep is NULL;

7)

SELECT	SUM(p.pib) AS Soma_PIB
FROM	pais p INNER JOIN	grupo g
ON		p.codgrupo = g.codgrupo
WHERE	(p.dt_indep >= CONVERT(DATETIME, '1950-01-01',102)
AND		p.renda_percapta <= 1000.00)
OR		g.grupo = 'Outro';

8)

SELECT	p.pais,
		p.qtde_hab,
		p.pib
FROM	pais p INNER JOIN	grupo g
ON		p.codgrupo = g.codgrupo
		INNER JOIN continente c
ON		p.codcontinente = c.codcontinente
WHERE	c.continente = 'Oceania'
OR		(p.qtde_hab > 500.000
AND		g.grupo = 'Alca');

9)

SELECT		pais,
			continente,
			valornegociado
FROM		continente c INNER JOIN	pais p
ON			c.codcontinente = p.codcontinente
			INNER JOIN paisxseg ps
ON			p.codpais = ps.codpais
			INNER JOIN	segmento s
ON			ps.codsegmento = s.codsegmento
WHERE		s.segmento = 'tecnologia'
AND			c.continente in('Europa','America do Norte')
ORDER BY	valornegociado DESC;

10)

SELECT		c.continente,
			AVG(p.renda_percapta) AS Media
FROM		continente c INNER JOIN pais p
ON			c.codcontinente = p.codcontinente
GROUP BY	c.continente;

11)

SELECT		g.grupo,
			SUM (ps.valornegociado) AS Total_VlrNeg
FROM		grupo g INNER JOIN pais p
ON			g.codgrupo = p.codgrupo
			INNER JOIN	paisxseg ps
ON			p.codpais = ps.codpais
WHERE		ps.dtreferencia BETWEEN CONVERT(DATETIME, '2007-04-01',102)
AND			CONVERT(DATETIME, '2008-08-01',102)
GROUP BY	g.grupo;

12)

SELECT 		s.segmento,
			AVG(p.pib) AS Media_Pib
FROM		pais p INNER JOIN paisxseg ps
ON			p.codpais = ps.codpais
			INNER JOIN segmento s
ON			ps.codsegmento = s.codsegmento
			INNER JOIN grupo g
ON			g.codgrupo = p.codgrupo
WHERE		g.grupo = 'Uniao Europeia'
GROUP BY	s.segmento;

