create function random_int(@min int, @max int)
returns int
as
begin

	declare @rand_val int = cast( (select random from random_view) * 1000000000 as int);
	declare @ret int = @min + (@rand_val % (@max - @min) );
	return @ret;

end
go

