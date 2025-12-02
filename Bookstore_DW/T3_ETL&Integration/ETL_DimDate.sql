DECLARE @Date DATE = '2020-04-03';
DECLARE @EndDate DATE = '2023-04-02';

WHILE @Date <= @EndDate
BEGIN
    INSERT INTO DimDate (
        DateKey, FullDate, Year, Month, MonthName, Day, DayOfWeek, DayName
    )
    VALUES (
        CONVERT(INT, FORMAT(@Date, 'yyyyMMdd')),
        @Date,
        YEAR(@Date),
        MONTH(@Date),
        DATENAME(MONTH, @Date),
        DAY(@Date),
        DATEPART(WEEKDAY, @Date),
        DATENAME(WEEKDAY, @Date)
    );

    SET @Date = DATEADD(DAY, 1, @Date);
END;
GO