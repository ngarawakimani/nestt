import { IsInt, IsJSON } from 'class-validator';

export class CreateTimeEntriesOfUserMultiProjectsDto {
  @IsJSON()
  readonly entries: any;

  @IsInt()
  readonly userId: number;
}
