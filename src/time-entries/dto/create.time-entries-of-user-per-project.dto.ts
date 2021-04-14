import { IsInt, IsObject } from 'class-validator';

export class CreateTimeEntriesOfUserPerProjectDto {
  @IsInt()
  readonly projectId: number;

  @IsObject()
  readonly entries: any;

  @IsInt()
  readonly userId: number;
}
