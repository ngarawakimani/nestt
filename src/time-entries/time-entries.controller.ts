import { Controller, Get, Post, Body, UsePipes } from '@nestjs/common';
import { TimeEntriesService } from './time-entries.service';
import { ValidationPipe } from '../shared/pipes/validation.pipe';
import { CreateTimeEntryOfUserPerProjectDto } from './dto/create.time-entry-of-user-per-project.dto';
import { CreateTimeEntriesOfUserPerProjectDto } from './dto/create.time-entries-of-user-per-project.dto';
import { CreateTimeEntriesOfUserMultiProjectsDto } from './dto/create.time-entries-of-user-multi-projects.dto';
import { CreateTimeEntriesOfUsersPerProjectDto } from './dto/create.time-entries-of-users-per-project.dto';
import {
  ApiBearerAuth,
  ApiOperation,
  ApiParam,
  ApiResponse,
  ApiTags,
} from '@nestjs/swagger';

@ApiBearerAuth()
@ApiTags('Time Entries')
@Controller('time-entries')
export class TimeEntriesController {
  private responseTimeEntries: any;
  constructor(private readonly timeEntriesService: TimeEntriesService) {
    this.responseTimeEntries = [];
  }

  @Get('projects')
  @ApiOperation({ summary: 'Get list of projects' })
  @ApiResponse({ status: 200, description: 'OK' })
  @ApiResponse({ status: 403, description: 'Forbiden' })
  getProjects(): any {
    return this.timeEntriesService.getProjects();
  }

  @Get('users')
  @ApiOperation({ summary: 'Get list of users' })
  @ApiResponse({ status: 200, description: 'OK' })
  @ApiResponse({ status: 403, description: 'Forbiden' })
  getUsers(): any {
    return this.timeEntriesService.getUsers();
  }

  @Get('issues')
  @ApiOperation({ summary: 'Get a list of issues in all projects' })
  @ApiResponse({ status: 200, description: 'OK' })
  @ApiResponse({ status: 403, description: 'Forbiden' })
  getIssues(): any {
    return this.timeEntriesService.getIssues();
  }

  @Post('time-entry-of-user-per-project')
  @ApiOperation({ summary: 'Create a Time Entry of a user per project' })
  @ApiParam({
    name: 'projectId',
    type: 'number',
    example: 1,
  })
  @ApiParam({
    name: 'spentOn',
    type: 'string',
    example: '2021-04-13',
  })
  @ApiParam({
    name: 'hours',
    type: 'number',
    example: 10,
  })
  @ApiParam({
    name: 'comments',
    type: 'string',
    example: 'Lorem Ipsum is simptext ev.',
  })
  @ApiParam({
    name: 'userId',
    type: 'number',
    example: 1,
  })
  @ApiResponse({
    status: 201,
    description: 'OK',
  })
  @ApiResponse({ status: 422, description: 'Unprocessable Entity' })
  @UsePipes(new ValidationPipe())
  timeEntryOfUserPerProject(
    @Body()
    timeEntryOfUserPerProjectDto: CreateTimeEntryOfUserPerProjectDto,
  ): any {
    return this.timeEntriesService.createTimeEntryOfUserPerProject(
      timeEntryOfUserPerProjectDto,
    );
  }

  @Post('time-entries-of-user-per-project')
  @ApiOperation({ summary: 'Create time entries of a user per project' })
  @ApiParam({
    name: 'projectId',
    type: 'number',
    example: 1,
  })
  @ApiParam({
    name: 'entries',
    type: 'object',
    example: [
      {
        spentOn: '2021-04-15',
        hours: 2,
        comments:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      },
    ],
  })
  @ApiParam({
    name: 'userId',
    type: 'number',
    example: 1,
  })
  @ApiResponse({
    status: 201,
    description: 'OK',
  })
  @ApiResponse({ status: 422, description: 'Unprocessable Entity' })
  timeEntriesOfUserPerProject(
    @Body()
    createTimeEntriesOfUserPerProjectDto: CreateTimeEntriesOfUserPerProjectDto,
  ): any {
    return this.timeEntriesService.createTimeEntriesOfUserPerProject(
      createTimeEntriesOfUserPerProjectDto,
    );
  }

  @Post('time-entries-of-user-multi-projects')
  @ApiOperation({
    summary: 'Create time entries of a user on multiple projects',
  })
  @ApiParam({
    name: 'entries',
    type: 'object',
    example: [
      {
        projectId: 1,
        spentOn: '2021-04-15',
        hours: 2,
        comments:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      },
    ],
  })
  @ApiParam({
    name: 'userId',
    type: 'number',
    example: 1,
  })
  @ApiResponse({
    status: 201,
    description: 'OK',
  })
  @ApiResponse({ status: 422, description: 'Unprocessable Entity' })
  timeEntriesOfUserMultiProjects(
    @Body()
    createTimeEntriesOfUserMultiProjectsDto: CreateTimeEntriesOfUserMultiProjectsDto,
  ): any {
    return this.timeEntriesService.createTimeEntriesOfUserMultiProjects(
      createTimeEntriesOfUserMultiProjectsDto,
    );
  }

  @Post('time-entries-of-users-per-project')
  @ApiOperation({ summary: 'Create time entries of users per project' })
  @ApiParam({
    name: 'projectId',
    type: 'number',
    example: 1,
  })
  @ApiParam({
    name: 'entries',
    type: 'object',
    example: [
      {
        userId: 6,
        spentOn: '2021-04-15',
        hours: 2,
        comments:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      },
    ],
  })
  @ApiResponse({
    status: 201,
    description: 'OK',
  })
  @ApiResponse({ status: 422, description: 'Unprocessable Entity' })
  timeEntriesOfUsersPerProject(
    @Body()
    createTimeEntriesOfUsersPerProjectDto: CreateTimeEntriesOfUsersPerProjectDto,
  ): any {
    return this.timeEntriesService.createTimeEntriesOfUsersPerProject(
      createTimeEntriesOfUsersPerProjectDto,
    );
  }
}
