import { IsInt, Length, IsNumber, IsString } from 'class-validator';

export class CreateSingleUserPerProjectDto {
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

  // issue_id or project_id (only one is required): the issue id or project id to log time on (both are integers);
  //  note that project ids can only be found using the API (e.g. at /projects.json)
  // spent_on: the date the time was spent (default to the current date); format is e.g. 2020-12-24
  // hours (required): the number of spent hours
  // activity_id: the id of the time activity. This parameter is required unless a default activity is defined in Redmine.
  // comments: short description for the entry (255 characters max)
  // user_id:
}