import { Controller, Get, Post, Body, UsePipes } from '@nestjs/common';
import { TimeEntriesService } from './time-entries.service';
import { HttpException } from '@nestjs/common/exceptions/http.exception';
import { ValidationPipe } from '../shared/pipes/validation.pipe';
import { CreateSingleUserPerProjectDto } from './dto/create.single-user-per-project.dto';

@Controller('time-entries')
export class TimeEntriesController {
  private projects: any;
  private users: any;

  constructor(private readonly timeEntriesService: TimeEntriesService) {}

  @Get('projects')
  getProjects(): any {
    return this.timeEntriesService.getProjects();
  }

  @Get('users')
  getUsers(): any {
    return this.timeEntriesService.getUsers();
  }

  @Get('issues')
  getIssues(): any {
    return this.timeEntriesService.getIssues();
  }

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
