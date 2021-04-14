import { IsInt, Length, IsNumber, IsString } from 'class-validator';

export class CreateTimeEntryOfUserPerProjectDto {
  @IsInt()
  readonly projectId: number;

  @IsString()
  @Length(10, 10)
  readonly spentOn: string;

  @IsNumber()
  readonly hours: number;

  @Length(10, 500)
  @IsString()
  readonly comments: string;

  @IsInt()
  readonly userId: number;
}
