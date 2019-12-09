--Requete 1 : Contact francais
SELECT companyname AS Société, contactname AS Contact, contacttitle AS Fonction, phone AS Téléphone  FROM Customers WHERE country = 'France';
--Requete 2 : Produits vendus par le fournisseur « Exotic Liquids : suppliers Id =1 »
SELECT ProductName AS Produit, UnitPrice AS Prix FROM `products` WHERE SupplierID = '1';
--Requete 3 :- Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant :
SELECT suppliers.CompanyName AS Fournisseur, COUNT(Products.SupplierID) as Nbre_produits FROM Suppliers
INNER JOIN Products ON Suppliers.SupplierID = Products.SupplierID
WHERE Suppliers.Country = 'France'
GROUP BY suppliers.CompanyName
HAVING COUNT(Products.SupplierID)
ORDER BY Nbre_produits DESC;
--GROUP BY regroupe par une colone
--HAving impose une condition.
--ORDER BY sert à ordonées DESC = décroissant
--Requete 4 : Liste des clients Français ayant plus de 10 commandes :
SELECT companyname AS Clients, COUNT(orders.customerID) AS Nbre_commandes FROM customers
INNER JOIN orders ON customers.CustomerID = orders.customerID
WHERE Country = 'France'
GROUP BY customers.CustomerID
HAVING COUNT(orders.customerID) > 10;
--Requete 5 - Liste des clients ayant un chiffre d’affaires > 30.000 :
SELECT customers.CompanyName AS Clie, SUM(order_details.UnitPrice*order_details.Quantity) AS CA, customers.Country AS Pays FROM customers
INNER JOIN orders ON customers.CustomerID = orders.CustomerID
INNER JOIN order_details ON order_details.OrderID = orders.OrderID
GROUP BY customers.CustomerID
HAVING CA > 30000
ORDER BY CA DESC;
--Requetes 6 – Liste des pays dont les clients ont passé commande de produits fournis par « ExoticLiquids » :
SELECT customers.Country AS pays FROM customers
INNER JOIN orders ON customers.CustomerID = orders.CustomerID
INNER JOIN order_details ON order_details.OrderID = orders.OrderID
INNER JOIN products ON products.ProductID = order_details.ProductID
INNER JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE suppliers.CompanyName = "Exotic Liquids"
GROUP BY pays;
--Requetes 7 – Montant des ventes de 1997 :
SELECT SUM(UnitPrice*Quantity) AS "Montant ventes 97" FROM order_details
INNER JOIN orders ON order_details.OrderID = orders.OrderID
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31';
--Requetes 8 – Montant des ventes de 1997 mois par mois :
SELECT MONTH(orderdate) AS "Mois 97", SUM(UnitPrice*Quantity) AS "Montant Ventes" FROM order_details
INNER JOIN orders ON order_details.OrderID = orders.OrderID
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31'
GROUP BY MONTH(orderdate);
--Requetes 9 – Depuis quelle date le client « Du monde entier » n’a plus commandé ?
SELECT MAX(OrderDate) AS "Date de dernière commandes" from orders WHERE CustomerID = 'DUMON';
--Requetes 10 – Quel est le délai moyen de livraison en jours ?
SELECT ROUND(AVG(DATEDIFF(ShippedDate, OrderDate))) AS "Délai moyen de livraison en jours" FROM orders
-- MAX Ressort la derniere valeur en date ou la max en fonction.
--Round = arrondir vers un nombre entier. AVG Faire la moyenne
