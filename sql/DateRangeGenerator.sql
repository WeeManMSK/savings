DECLARE @StartDate DATE = '20180101'
  , @EndDate DATE = '20180801'

SELECT  DATEADD(DAY, nbr - 1, @StartDate)
FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY c.object_id ) AS Nbr
          FROM      sys.columns c
        ) nbrs
WHERE   nbr - 1 <= DATEDIFF(DAY, @StartDate, @EndDate)
