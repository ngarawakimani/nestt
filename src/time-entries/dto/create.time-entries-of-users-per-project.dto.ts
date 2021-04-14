import { IsInt, IsObject } from 'class-validator';

export class CreateTimeEntriesOfUsersPerProjectDto {
  @IsInt()
  readonly projectId: number;

  @IsObject()
  readonly entries: any;
}
