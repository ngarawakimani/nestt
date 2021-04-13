import { Controller, Get, Post, Body, UsePipes } from '@nestjs/common';
import { TimeEntriesService } from './time-entries.service';
import { HttpException } from '@nestjs/common/exceptions/http.exception';
import { ValidationPipe } from '../shared/pipes/validation.pipe';
import { CreateSingleUserPerProjectDto } from './dto/create.single-user-per-project.dto';
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
  private projects: any;
  private users: any;

  constructor(private readonly timeEntriesService: TimeEntriesService) {}

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

  @Post()
  @ApiOperation({ summary: 'Create a single user per project' })
  @ApiParam({
    name: 'project_id',
    type: 'number',
    example: 1,
  })
  @ApiParam({
    name: 'spent_on',
    type: 'string',
    example: '2021-04-13',
  })
  @ApiParam({
    name: 'time_entry',
    type: 'json',
    example: {
      hours: 10,
      activity_id: 5,
    },
  })
  @ApiParam({
    name: 'comments',
    type: 'string',
    example: 'Lorem Ipsum is simptext ev.',
  })
  @ApiParam({
    name: 'user_id',
    type: 'number',
    example: 1,
  })
  @ApiResponse({
    status: 200,
    description: 'OK',
    type: CreateSingleUserPerProjectDto,
  })
  @ApiResponse({ status: 422, description: 'Unprocessable Entity' })
  @UsePipes(new ValidationPipe())
  @Post('single-user-per-project')
  singleUserPerProject(
    @Body() createSingleUserPerProjectDto: CreateSingleUserPerProjectDto,
  ): any {
    return this.timeEntriesService
      .singleUserPerProject(createSingleUserPerProjectDto)
      .catch((error) => console.log(error));
  }
}
