create function random_char(@base int)
returns char
as
begin

	declare @ret char = char( dbo.random_int(@base, @base + 26) );
	return @ret;

end
go

create function random_string(@min_len int, @max_len int, @type int, @prefix varchar(10) = '', @suffix varchar(10) = '')
returns varchar(100)
as
begin
	declare @base int;
	
	if @type = 1
		set @base = 65;
	else
		set @base = 97;

	declare @ret varchar(100);

	set @ret = @prefix;

	if @type = 3
		set @ret += dbo.random_char(97);
	else
		set @ret += dbo.random_char(65);

	declare @it int = 0;
	declare @len int = dbo.random_int (@min_len, @max_len);

	while @it < @len
	begin
		set @ret += dbo.random_char(@base); 	
		set @it += 1;
	end

	set @ret += @suffix;
	return @ret;
end
go
