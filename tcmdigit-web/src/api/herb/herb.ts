import { describe } from 'vitest'
// src/api/herb/herb.ts

import axios from 'axios'

interface Herb {
  herb_id: number
  herb_name: string
  image: string
  description: string
}

export const getHerbs = async (): Promise<Herb[]> => {
  const response = await axios.get('/api/herbs')
  return response.data
}

export const getHerbById = async (id: number): Promise<Herb> => {
  const response = await axios.get(`/api/herbs/${id}`)
  return response.data
}
