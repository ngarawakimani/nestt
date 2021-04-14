import { IsInt, IsString, IsNumber, Length } from 'class-validator';

export class TimeEntriesProjectsDto {
  @IsInt()
  readonly projectId: number;

  @IsString()
  @Length(10)
  readonly spentOn: string;

  @IsNumber()
  readonly hours: number;

  @Length(10, 500)
  @IsString()
  readonly comments: string;
}
