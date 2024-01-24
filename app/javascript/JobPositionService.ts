type Company = {
  id: string,
  name: string,
  website_url?: string
}

export type JobPosition = {
  id: string,
  title: string,
  domain?: string,
  interest_level?: string,
  company: Company
}

export const getJobPositions = async (): Promise<Array<JobPosition>> => {
  const response = await fetch('/api/job_positions.json');
  return await response.json() as JobPosition[];
}